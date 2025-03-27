#!/bin/bash
sudo apt-get update -y &&
sudo apt-get install -y \
apt-transport-https \
ca-certificates \
curl \
gnupg-agent \
software-properties-common &&
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - &&
sudo add-apt-repository  "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" &&
sudo apt-get update -y &&
sudo sudo apt-get install -y docker-ce docker-ce-cli containerd.io &&
sudo usermod -aG docker ubuntu
sudo apt install nginx -y
sudo apt install curl wget -y
sudo apt install htop -y
sudo apt install neofetch -y
sudo apt install nano -y
sudo apt install git -y
sudo apt install nodejs npm -y
sudo apt install postgresql postgresql-contrib -y
sudo apt install redis-server -y
sudo apt install mongodb-server -y
sudo apt install net-tools -y
sudo apt install zip unzip -y
sudo apt update && sudo apt upgrade -y
instance_id=$(curl http://169.254.169.254/latest/meta-data/instance-id)
instance_number=$(count.index)
public_ip=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)
echo "<h1>Instance ID: $instance_id</h1>" > /var/www/html/index.html
echo "<h1>Instance Number: $instance_number</h1>" >> /var/www/html/index.html
echo "<h1>Public IP: $public_ip</h1>" >> /var/www/html/index.html
sudo systemctl start nginx
sudo systemctl enable nginx
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
PUBLIC_IP=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)
INSTANCE_NUMBER=$(curl -s http://169.254.169.254/latest/meta-data/ami-launch-index)

# Write the HTML file
sudo cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Congrats Lawrence!</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(90deg, #ff416c, #ff4b2b);
            color: white;
            text-align: center;
            padding: 20px;
        }
        h1 {
            font-size: 3em;
            font-weight: bold;
            text-shadow: 0 0 10px #ffffff, 0 0 20px #ffcc00, 0 0 30px #ff6600;
            animation: glow 1.5s infinite alternate;
        }
        @keyframes glow {
            from {
                text-shadow: 0 0 10px #ffffff, 0 0 20px #ffcc00, 0 0 30px #ff6600;
            }
            to {
                text-shadow: 0 0 20px #ffffff, 0 0 30px #ffcc00, 0 0 40px #ff6600;
            }
        }
        ul {
            list-style: none;
            padding: 0;
        }
        li {
            display: inline;
            margin: 15px;
        }
        a {
            text-decoration: none;
            font-size: 1.5em;
            font-weight: bold;
            color: #fff;
            padding: 10px 20px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 10px;
            transition: 0.3s;
        }
        a:hover {
            background: rgba(255, 255, 255, 0.4);
        }
        .icons {
            margin-top: 20px;
        }
        .icons i {
            margin: 10px;
            font-size: 2.5em;
            transition: transform 0.3s;
        }
        .icons i:hover {
            transform: scale(1.2);
        }
    </style>
</head>
<body>
    <h1>Congrats Lawrence!</h1>
    <p>The nginx server is working as expected. </p>
    <h2>Check out these links:</h2>
    <h1>Instance ID: $INSTANCE_ID</h1>
    <h1>Instance Number: $INSTANCE_NUMBER</h1>
    <h1>Public IP: $PUBLIC_IP</h1>
    <ul>
        <li><a href="https://www.google.com">Google</a></li>
        <li><a href="https://www.facebook.com">Facebook</a></li>
        <li><a href="https://www.instagram.com">Instagram</a></li>
    </ul>
    <p>Enjoy the enhanced aesthetics with glowing text and vibrant colors!</p>
    <div class="icons">
        <i class="fab fa-google"></i>
        <i class="fab fa-facebook"></i>
        <i class="fab fa-instagram"></i>
    </div>
</body>
</html>

EOF

sudo systemctl restart nginx

