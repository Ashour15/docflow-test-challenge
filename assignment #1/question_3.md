## Q3
Please provide a list of System's dependencies: database, server, and 3rd
party packages that might be required if we are to deploy this as an
application.


- Database: Recommended to user PostgreSQL as it has more datatypes and features than MYSQL
- Hosting service: eg: AWS,Azure, Heroku, Digital ocean..
- A cloud monitoring service for our servers: eg: Datadog, dynatrace
- Application monitoring and error tracking software: eg: Sentry, Airbrake
- APM service for application/database performance tracking: eg: ScoutaAPM
- A background processing service: Sidekiq
- Dockerize the application and upload it to container register service so it's easier when we deploy our application
- CI/CD tool to maxmimize performance and automate our deploys: We could either use a external service such as Semaphore or setup using Github actions 
