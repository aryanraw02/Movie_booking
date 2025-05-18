import os
import json
import requests
from bs4 import BeautifulSoup

# Configuration for URLs and storage directories
HOME_BETA_URL = "https://betacinemas.vn/home.htm"
DETAIL_BETA_FOLDER = "crawl/movie_details/"
OUTPUT_FILE = "crawl/craw_beta_detail.json"
BASE_MOVIE_URL = "https://betacinemas.vn/chi-tiet-phim.htm?gf="

# Create the movie details folder if it does not exist
os.makedirs(DETAIL_BETA_FOLDER, exist_ok=True)

def download_html(url, file_path):
    """Download HTML content from a URL if it is not cached locally."""
    if not os.path.exists(file_path):
        print(f"🌍 Downloading data from: {url}")
        response = requests.get(url)
        if response.status_code == 200:
            with open(file_path, "w", encoding="utf-8") as f:
                f.write(response.text)
            return response.text
        else:
            print(f"⚠️ Unable to download data from {url}, status code: {response.status_code}")
            return None
    else:
        with open(file_path, "r", encoding="utf-8") as f:
            return f.read()

def extract_movies(home_html):
    """Extract the list of movies from the home page HTML."""
    soup = BeautifulSoup(home_html, "html.parser")
    movies = []
    
    for movie_block in soup.find_all("div", class_="film-info"):
        title_tag = movie_block.find("h3")  # Movie title
        img_tag = movie_block.find("img")   # Movie thumbnail image
        link_tag = movie_block.find("a", href=True)  # Link to movie details
        
        detail_url = link_tag["href"] if link_tag else ""
        movie_id = detail_url.split("=")[-1] if "=" in detail_url else ""
        
        movies.append({
            "id": movie_id,
            "name": title_tag.text.strip() if title_tag else "",
            "thumb": img_tag["src"] if img_tag else "",
            "detail_url": BASE_MOVIE_URL + movie_id
        })
    
    return movies

def extract_movie_detail(detail_html):
    """Extract detailed information of a movie from its detail page."""
    soup = BeautifulSoup(detail_html, "html.parser")
    movie_detail = {
        "description": "",
        "trailer": "",
        "release_date": "",
        "duration": "",
        "genres": [],
        "casts": [],
        "thumb": ""
    }
    
    # Extract movie description
    description_tag = soup.find("p", class_="text-justify")
    if description_tag:
        movie_detail["description"] = description_tag.text.strip()
    
    # Extract YouTube trailer link
    trailer_tag = soup.find("iframe", src=True)
    if trailer_tag:
        movie_detail["trailer"] = trailer_tag["src"]
    
    # Extract release date, genre, duration, and cast
    for info_row in soup.find_all("div", class_="row font-lg font-family-san font-xs-14"):
        label = info_row.find("span", class_="bold")
        value = info_row.find("div", class_="col-lg-12")
        
        if label and value:
            key = label.text.strip()
            val = value.text.strip()
            if "Ngày khởi chiếu" in key:  # Release date
                movie_detail["release_date"] = val
            elif "Thể loại" in key:  # Genres
                movie_detail["genres"] = [g.strip() for g in val.split(",")]
            elif "Thời lượng" in key:  # Duration
                movie_detail["duration"] = val.replace(" phút", "")
            elif "Diễn viên" in key:  # Cast
                movie_detail["casts"] = [c.strip() for c in val.split(",")]
    
    # Extract thumbnail image
    image_tag = soup.select_one(".pi-img-wrapper img")
    if image_tag and 'src' in image_tag.attrs:
        movie_detail["thumb"] = image_tag['src']
    
    return movie_detail

def main():
    print("🚀 Processing data...")
    
    # Download home page HTML
    home_html = download_html(HOME_BETA_URL, "crawl/betacinemas.html")
    if not home_html:
        print("❌ Error downloading home page, stopping process.")
        return
    
    # Extract the list of movies
    movies = extract_movies(home_html)
    detailed_movies = []
    
    # Download and extract details for each movie
    for movie in movies:
        movie_id = movie["id"]
        detail_html = download_html(movie["detail_url"], f"{DETAIL_BETA_FOLDER}{movie_id}.html")
        
        if detail_html:
            movie_detail = extract_movie_detail(detail_html)
            movie.update(movie_detail)
            detailed_movies.append(movie)
        else:
            print(f"⚠️ Unable to retrieve detailed data for movie: {movie['name']}")
            detailed_movies.append(movie)
    
    # Save extracted data to a JSON file
    with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
        json.dump(detailed_movies, f, indent=4, ensure_ascii=False)
    
    print(f"✅ Data has been saved to {OUTPUT_FILE}")

if __name__ == "__main__":
    main()
