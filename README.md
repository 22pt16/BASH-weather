# 🌦️ BASH-weather

Welcome to **BASH-weather**, a weather forecasting application built using Bash! This application utilizes API requests with the `wget` command to fetch details of the current weather at a given location.

## 📋 Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Usage](#usage)
- [APIs Used](#apis-used)

## 👋 Introduction
BASH-weather is a simple yet effective weather forecasting tool designed to run in a Bash terminal. It provides current weather details for a specified location, allowing users to either enter the location manually or find it through their device's IP address.

## ✨ Features
- 📍 Fetches weather details for a specified location
- 🌡️ Provides current temperature, humidity, wind speed, and weather condition
- 📅 Displays forecast for up to 2 days
- 🌈 Colorful and appealing display elements in the terminal

## 🚀 Usage
1. Clone the repository:
    ```bash
    git clone https://github.com/22pt16/BASH-weather.git
    ```
2. Navigate to the project directory:
    ```bash
    cd BASH-weather
    ```

3. Run the `weather.sh` script with the desired location:
    ```bash
    ./main.sh "Coimbatore"
    ```

    or

    ```bash
    ./main.sh
    ```

4. Follow the on-screen prompts to enter the location manually or use the device's IP.

## 🛠️ APIs Used
1. **IP Finder**: Retrieves the present active device's IP address.
2. **Location Coordinates**: Determines the latitude and longitude of the location using the IP address.
3. **Realtime Weather API**: Fetches JSON and HTML files containing details of the weather forecast for the specified location.

---

Thank you for exploring **BASH-weather**! If you encounter any issues or have suggestions for improvements, feel free to open an issue or contribute to the project.

Happy forecasting! 🌤️
