<%-- 
    Document   : LoginPage
    Created on : 17 avr. 2024, 00:19:56
    Author     : alexi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mini DashBoard</title>
    </head>
   
    <style>

@import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');
body {
  font-family: "Poppins", sans-serif;
  font-weight: 400;
  margin: 0;
  padding: 0;
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  background-color: rgba(89, 83, 83, 0.138);
}

.login-container {
  width: 500px;
  height: 380px;
  flex-direction: column;
  align-items: center;
  padding: 20px;
  background-color: #fff;
  box-shadow: 0 0 10px rgb(0 0 0 / 5%);
}

.login-container h2 {
  margin-bottom: 20px;
}

.form-group {
  width: 100%; /* Fait en sorte que la largeur soit de 100% */
  margin-bottom: 20px;
}

label {
  font-size:16px;
  color: #767474;
}

input,
button {
  font-size:14px;
  margin-top: 10px;
  width: 100%; /* Largeur à 100% moins la marge et la bordure */
  padding: 15px;
  border: 1px solid #ccc;
  border-radius: 3px;
  box-sizing: border-box; /* Inclus les bordures et le padding dans la largeur */
}

button {
  background-color: #425d97;
  color: #fff;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.img {
  margin-left: 125px;
  margin-top: -35px;
  width: 250px;
}

    </style>
    
    <body>
        <div class="login-container">
            <div class="img-container">
              <img class="img" src="https://i.ibb.co/XLJcLBh/Logo.png" alt="logo"/>
            </div>
            <form action="connexion" method="POST">
              <div class="form-group">
                <label for="email">Adresse Email</label>
                <input type="email" id="email" name="email" placeholder="Email" required>
              </div>
              <div class="form-group">
                <label for="password">Mot de passe</label>
                <input type="password" id="password" name="password" placeholder="Mot de passe" required>
              </div>
              <button type="submit">Se Connecter</button>
            </form>
        </div>
</body>
</html>
