#!/bin/bash
sudo apt update
sudo apt install -y apache2

# Get the instance ID using the instance metadata
INSTANCE_ID=$(curl -s http://169.254.119.154/latest/meta-data/instance-id)

# Install AWS cli
apt install -y awscli

# Create a simple HTML file with the portfolio content and display the images
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
  <title>My Portfolio</title>
  <style>
    /* Add animation and styling for the text */
    @keyframes colorChange {
      0% { color: red; }
      50% { color: green; }
      100% { color: blue; }
    }
    h1 {
      animation: colorChange 2s infinite;
    }
  </style>
</head>
<body>
  <h1>Terraform Project Server 2</h1>
  <h2>Instance ID: <span style="color:green">$INSTANCE_ID</span></h2>

</body>
</html>
EOF


# Start and enable the apache server
sudo systemctl start apache2
sudo systemctl enable apache2
