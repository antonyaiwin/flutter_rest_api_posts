# flutter_rest_api_posts

A Flutter project that utilizes a REST API to fetch posts from the web and display them in the UI.

## Project Description

The project fetches posts from a web service using a REST API, converts the received JSON data into corresponding class objects, and then displays the data in the UI. Additionally, the project fetches related data from another API call.

## Getting Started

### Prerequisites

Before running the project, make sure you have the following installed:

- Flutter SDK
- Dart SDK
- Any additional dependencies mentioned in the `pubspec.yaml` file.

### Running the Program

1. Run the application, and the home page will appear.

2. On the home page, find the 'Posts' button.

3. Click on the 'Posts' button to open the 'posts_page.' The app will make an HTTP request to retrieve post data from the web.

4. During data fetching, a loading animation will be displayed.

5. Once the data is fetched, the loading animation will be replaced with a ListView.builder, showing the posts. Each row includes the title, a small portion of the body, and the author.

6. To read a post in full and view comments, click on the 'Read More...' button associated with each post.

## YouTube Demo

[![Project Demo](https://img.youtube.com/vi/ro6mC65dHCg/0.jpg)](https://www.youtube.com/watch?v=ro6mC65dHCg)


