Automated Hospital Log Management System
Project Overview
This project implements an automated log management and analysis system for a simulated hospital environment.
 It collects real-time data from simulated medical and utility devices, archives log files interactively, and generates analytical reports using Linux command-line tools.
The project demonstrates proficiency in:
●	Interactive shell scripting

●	Log file management and automation

●	Data analysis using Linux CLI utilities

●	Collaborative development using Git and GitHub

________________________________________
System Components
1. Python Device Simulators
These scripts simulate real-time data generation and continuously write logs.
●	heart_rate_monitor.py
 Simulates two heart rate monitoring devices.

●	temperature_recorder.py
 Simulates two temperature sensors.

●	water_consumption.py
 Simulates water usage monitoring.

Each simulator writes log entries to the active logs directory.
________________________________________
2. Shell Scripts
archive_logs.sh
An interactive script that:
●	Prompts the user to select a log type to archive

●	Archives the selected log with a timestamp

●	Creates a new empty log file to allow continued monitoring

●	Validates user input and handles errors gracefully

analyze_logs.sh
An interactive analysis script that:
●	Allows the user to select a log file to analyze

●	Counts occurrences of each device in the log

●	Extracts the first and last timestamps (temporal analysis)

●	Appends results to a cumulative analysis report
Project Directory Structure

Coding-lab_Group18/
│
├── archive_logs.sh
├── analyze_logs.sh
├── README.md
│
├── heart_rate_monitor.py
├── temperature_recorder.py
├── water_consumption.py
│
├── hospital_data/
│   ├── active_logs/
│   │   ├── heart_rate.log
│   │   ├── temperature.log
│   │   └── water_usage.log
│   └── archive_logs/
│
└── reports/
    └── analysis_report.txt

Setup Instructions
1. Clone the Repository
git clone https://github.com/<your-username>/Coding-lab_Group18.git
cd Coding-lab_Group18

2. Start the Device Simulators
Each simulator should be started in a separate terminal:
python3 heart_rate_monitor.py start
python3 temperature_recorder.py start
python3 water_consumption.py start

________________________________________
3. Verify Active Log Generation
ls hospital_data/active_logs
tail -f hospital_data/active_logs/heart_rate.log

________________________________________
Task 1: Log Archiving
Script: archive_logs.sh
Run the script:
./archive_logs.sh

Example menu:
Select log to archive:
1) Heart Rate
2) Temperature
3) Water Usage
Enter choice (1-3):

Functionality
●	Archives the selected log into hospital_data/archive_logs

Renames archived logs using timestamps:

 heart_rate_YYYY-MM-DD_HH:MM:SS.log
●	
●	Recreates an empty active log file for continued monitoring

●	Handles invalid input and missing files

________________________________________
Task 2: Log Analysis
Script: analyze_logs.sh
Run the script:
./analyze_logs.sh

Example menu:
Select log file to analyze:
1) Heart Rate
2) Temperature
3) Water Usage
Enter choice (1-3):

Analysis Performed
●	Counts log entries per device

●	Extracts:

○	First timestamp

○	Last timestamp

Appends results to:

 reports/analysis_report.txt
●	
________________________________________
Sample Analysis Report Output
======================================
Heart Rate Analysis
Date: Tue Jun 18 15:22:10 UTC 2024
Log file: heart_rate.log
--------------------------------------
Device statistics:
 120 HR_Device_1
 115 HR_Device_2
--------------------------------------
First entry timestamp:
2024-06-18T14:00:01
Last entry timestamp:
2024-06-18T15:22:09

________________________________________
Linux Tools Used
Purpose	Tools
File operations	mv, touch, mkdir, test
User interaction	read, case
Log analysis	awk, sort, uniq, head, tail
Reporting	echo, date, output redirection (>>)
________________________________________
Collaboration & Version Control
●	The project is developed collaboratively using GitHub

●	Multiple contributors commit changes independently

●	Clear commit messages reflect individual contributions

●	Tasks are distributed to ensure teamwork visibility

Learning Objectives Achieved
✔ Interactive shell scripting
 ✔ Automated log rotation
 ✔ Real-time log analysis
 ✔ Linux CLI data processing
 ✔ Professional project organization
 ✔ Collaborative software development
________________________________________
Authors
Group 18 — Coding Lab
 Contributors:
●	Brian HIRWA NTWALI (github username: 678b) (Repository Owner & Task 1 Implementation)

●	INEZA Hakizimana Ivan (github username: Ivan70807) (Task 2: Interactive prompt)

●	INEZA Ndahirwa Sosthene (github username: inezaNdahirwaSosthene) (Task 2: Analysis functionality)

●	Clovis INDOHA (github username: cindoha-hash) ( Task 2: Reporting)

●	Kevin Iradukunda (README.md)
 

________________________________________
Final Notes
This project simulates real-world system administration practices, including log management, monitoring, and analytics, using standard Linux tools and scripting techniques.

