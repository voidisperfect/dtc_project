### [DTC DE zoomcamp project](https://github.com/DataTalksClub/data-engineering-zoomcamp) with covid data
## Overview
I am using data from https://covid19.who.int/ to visualize covid trends. 
Focusing on using the technology and not complexity of the code because I am not very good with it yet.
## Technologies
To run this project you need:
* Terraform
* Docker
* Google Cloud Platform (GCP) account
## Data Pipeline
![](https://i.imgur.com/Xj2vsIn.jpeg)
* Terraform launches GCP resources (GCS)
* Docker launches Mage image
* Inside Mage we load data from WHO URL and clean it, then we export clean csv file to GCS AND using DBT we load our data to BigQuery, creating 2 tables: 1 is partitioned and clustered by date and region, and other isn't. DBT creates bigquery table and project itself.
![](https://i.imgur.com/pgrgCwe.png)
* Visualize data with looker studio
## Instructions
You can run Mage in GCP by following its [documentation](https://docs.mage.ai/production/deploying-to-cloud/gcp/setup) but I wouldn't recommend it for this project because it is too complex for no reason. So I suggest using instructions from another [project](https://github.com/datavadoz/eu-airbnb) as a better solution:
1. Create GCP project named `dtc-covid`.
2. Create service account on GCP inside `dtc-covid` project with 4 following roles: Actions Viewer, BigQuery Admin, Storage Admin, Storage Object Admin. Then, download this GCP service account credential JSON file to `./credentials` (on the same directory level with this README) and set the absolute path to `GOOGLE_APPLICATION_CREDENTIALS` environment variable: `export GOOGLE_APPLICATION_CREDENTIALS=<gcp_credential_json_path>` or `$env:GOOGLE_APPLICATION_CREDENTIALS="KEY_PATH"`. 
3. Bring GCP infrastructure up:
```
cd terraform
terraform init
terraform apply
cd ..
```
4. Replace `<your_gcp_credential_json>` with your GCP credential JSON file name (e.g: dtc-covid-7a8ff7d6804f.json) in the environment variable `GOOGLE_APPLICATION_CREDENTIALS `value inside `docker-compose.yml`.
If you run into an error while running the pipeline, also change it in `dbt/dtc_project/profiles.yml`
5. Build Docker image: ```docker compose build```
6. Bring Mage docker container up: ```docker compose up -d```
7. Browse Mage UI `http://localhost:6789/pipelines` and hit `Run pipeline now` button to run `dtc_pipeline`.
You can also makae a scheduled run to run this pipeline weekly when WHO updates their data by clicking `Create new trigger` and choosing desired settings, for example: ![](https://i.imgur.com/l5wlBkj.png)
## Dashboard
You can view interactive version by accessing this [link](https://lookerstudio.google.com/reporting/873f5262-22ab-45bb-ac71-176f2b12678d)
![](https://i.imgur.com/F8LU6wd.png)
![](https://i.imgur.com/jPky6M0.png)
