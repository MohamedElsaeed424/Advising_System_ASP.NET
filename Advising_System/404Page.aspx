<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="404Page.aspx.cs" Inherits="Advising_System._404Page" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>404 - Not Found</title>
    <style>
        body {
    margin: 0;
    padding: 0;
    font-family: 'Arial', sans-serif;
    background-color: #1c1c1c;
    color: #fff;
}

.container {
    display: flex;
    align-items: center;
    justify-content: center;
    height: 100vh;
}

.error-container {
    text-align: center;
}

h1 {
    font-size: 8em;
    margin: 0;
    color: #ff6666; /* Red color */
}

p {
    font-size: 1.5em;
    margin: 10px 0;
}

a {
    display: inline-block;
    padding: 10px 20px;
    background-color: #ff6666;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s;
}

a:hover {
    background-color: #ff3333;
}

    </style>
</head>
<body>
    <div class="container">
        <div class="error-container">
            <h1>404</h1>
            <p>Oops! Something went wrong.</p>
            <p>The page you are looking for might be in another dimension.</p>
        </div>
    </div>
</body>
</html>
