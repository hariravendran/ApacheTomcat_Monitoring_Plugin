# ApacheTomcat_Monitoring_Plugin
As we know, not all linux would automatically switches on the apache tomcat service. Since Apache Tomcat is crucial for a server hosting WebApp, this plugin is useful to monitor Apache Tomcat status every minute and logs it's information for analysis as needed.

## Features

- Monitors Apache Tomcat process status.
- Logs CPU and memory usage.
- Sends email alerts for critical issues.
- Configurable CPU and memory usage thresholds.

## Prerequisites

- Apache Tomcat installed and running.
- Bash shell (Linux or macOS).
- `mail` command or equivalent installed for email notifications.
- `bc` utility installed for floating-point calculations.

## Installation Steps

1. **Clone the Repository**

   Clone this repository to your local machine:

   ```bash
   git clone https://github.com/hariravendran/ApacheTomcat_Monitoring_Plugin.git
   cd ApacheTomcat_Monitoring_Plugin
   ```

2. **Make the Script Executable**

   Navigate to the directory where the script(apache_plugin.sh) is located and make it executable:

   ```bash
   chmod +x monitor_tomcat.sh
   ```

3. **Configure the Script**

   Open the `monitor_tomcat.sh` script in a text editor and configure the following settings:

   - `LOG_FILE`: Path where you want to store the log file.
   - `EMAIL`: Your email address to receive notifications.
   - `CPU_THRESHOLD` and `MEM_THRESHOLD`: Set your desired resource usage thresholds.

   Example:
   ```bash
   LOG_FILE="/path/to/tomcat_monitor.log"
   EMAIL="your_email@example.com"
   CPU_THRESHOLD=80
   MEM_THRESHOLD=80
   ```

4. **Install Email Utility**

   If you don't have a mail utility installed, you can install one. For example, on Debian/Ubuntu, run:

   ```bash
   sudo apt-get install mailutils
   ```

   On Red Hat/CentOS, you can use:

   ```bash
   sudo yum install mailx
   ```

5. **Add to Crontab**

   To schedule the script to run every minute, add it to your crontab:

   ```bash
   crontab -e
   ```

   Add the following line (make sure to use the correct path to your script):

   ```bash
   * * * * * /path/to/monitor_tomcat.sh &>> /path/to/tomcat_monitor.log
   ```

6. **Verify Functionality**

   You can manually run the script to ensure it works as expected:

   ```bash
   /path/to/monitor_tomcat.sh
   ```

   Check the log file to see if entries are being recorded properly.

## License

This project is licensed under the MIT License.

## Acknowledgments

- Thanks to the contributors and maintainers of the libraries used in this script.
