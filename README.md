# Weather-script
A Linux shell script that on execution downloads the weather report for Casablanca from wttr.in/Casablanca as weather-raw-data-"currentdate".txt. 
And adds to the table on the log file "poc.log" the observed temperature and forecasted temperature.
HOW TO RUN :
1-download the files in the same folder
2-Add a cronjob:
  execute on the terminal :crontab -e
  write : 0 12 * * * /Path/to/poc.sh
  close
