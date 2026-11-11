# School Zone Air Quality Management System
BIC 20903 / BIC 20904 - OOP Group Project (SDG 11.6) - Title No. 38

## How to run
Requires JDK 17 or newer.
- Windows: double-click `run.bat`
- Linux / macOS: `./run.sh`
- Manual: `mkdir out && javac -d out src/*.java && java -cp out Main`

In NetBeans / IntelliJ / Eclipse: create a new Java project and copy the files from `src/` into it. Main class = `Main`.
Records are saved automatically to the `data/` folder (schools.csv, readings.csv) on exit and loaded on start.
Tip: use menu option 5 to load fictional sample data for a quick demonstration.

## Classes
| Class | Role |
|---|---|
| Main | Main class - console menus |
| Location (abstract) -> School | Inheritance: school records |
| AirReading (abstract) -> Pm25Reading, Pm10Reading | Inheritance + polymorphism: each reading classifies itself |
| AirQuality (enum) | Six air-quality categories; "poor" = Unhealthy (Sensitive) or worse |
| SchoolManager | ArrayLists, add/remove/search/update/display, calculations |
| SchoolSummary | Immutable result of the calculations for one school |
| FileHandler | CSV save / load |
| InputHelper, Validator | Input validation |
| InvalidInputException, RecordNotFoundException | Custom exceptions |
| SampleData | Fictional demo data (NOT measured) |

## Calculations
1. **Days with poor air quality (SDG 11.6 indicator)** = distinct dates with at least one PM2.5 or PM10 reading in the "poor" range.
2. Poor-day rate (%) = poor days / monitored days x 100 (0 if no monitored days).
3. Average PM2.5 and PM10 (ug/m3).
4. Estimated student-days exposed = poor days x enrolment (ESTIMATE).

Category limits are adapted from the US EPA AQI 24-hour breakpoints - confirm or replace them with the standard your group cites in the report (limits are in Pm25Reading.java and Pm10Reading.java).
