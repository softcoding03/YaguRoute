<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        body {
            background-image: url('background.jpg');
            background-size: cover;
            font-family: Arial, sans-serif;
        }

        .login-container {
            width: 300px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            margin: 0 auto;
            background-color: #ffffff;
        }

        .login-container h2 {
            text-align: center;
            color: #333333;
        }

        .login-container label {
            display: block;
            margin-bottom: 10px;
            color: #333333;
        }

        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: 100%;
            height: 30px;
            padding: 5px;
            border-radius: 5px;
            border: 1px solid #cccccc;
        }

        .login-container input[type="submit"] {
            width: 100%;
            height: 30px;
            background-color: #4CAF50;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .login-container input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
        <form>
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <input type="submit" value="Login">
        </form>
    </div>
</body>
</html>