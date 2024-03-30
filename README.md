# Google Playstore Apps

<p align="center">
  <img src="images\playstore.jpg">
</p>

---
## Index

- [Description and Objective](#description-and-objective)
- [Technologies](#technologies)
- [Data Architecture](#data-architecture)
- [Replication of the project](#replication-of-the-project)

---

## Description and Objective

This dataset provides comprehensive information about Google Play Store apps, covering various attributes including app name, category, rating, reviews, size, and more.

- **Overview**

  The dataset is valuable for conducting diverse analyses and machine learning projects related to app development, market trends, user behavior, and other related fields.

- **Data Description**

  - **App**: Name of the application.
  - **Category**: Category to which the app belongs (e.g., "Art & Design", "Education", "Entertainment", etc.).
  - **Rating**: Average user rating of the app.
  - **Reviews**: Number of user reviews for the app.
  - **Size**: Size of the app in terms of storage space.
  - **Installs**: Number of times the app has been installed.
  - **Type**: Whether the app is free or paid.
  - **Price**: Price of the app (if it's a paid app).
  - **Content Rating**: Age group for which the app is appropriate.
  - **Genres**: Additional genres to which the app belongs.
  - **Last Updated**: Date when the app was last updated.
  - **Current Ver**: Current version of the app.
  - **Android Ver**: Minimum required Android version.

- **Usage**

  - **Exploratory Data Analysis (EDA)**: Analyze trends and patterns in the data to gain insights into the app market.
  - **Predictive Modeling**: Build machine learning models to predict app success, user ratings, or other metrics based on various features.
  - **Market Research**: Understand user preferences, popular categories, and app characteristics to inform business decisions.
  - **App Recommendations**: Develop recommendation systems to suggest apps to users based on their preferences and behavior.

- **Source**

  The dataset is available for download on [Kaggle](https://www.kaggle.com/datasets/gauthamp10/google-playstore-apps). It can be explored and analyzed using data analysis tools like Python with libraries such as pandas, matplotlib, and seaborn. Additionally, machine learning frameworks like scikit-learn or TensorFlow can be utilized for predictive modeling tasks.

- **Objective**

  The objective of this project is to establish an efficient data pipeline for processing and analyzing the Google Play Store apps dataset. The key goals include:

  - Designing and implementing a scalable data pipeline to ingest, clean, and transform the dataset.
  - Developing automation scripts for infrastructure provisioning and task orchestration.
  - Leveraging cloud services for storage, data processing, and visualization.
  - Demonstrating the end-to-end pipeline from data ingestion to report generation, showcasing insights into app market trends, user behavior, and more.

---

## Technologies

- Terraform

  [Terraform](https://www.terraform.io/) is an open-source infrastructure-as-code software tool provided by HashiCorp. It allows users to define and provision data center infrastructure using a declarative configuration language known as HashiCorp Configuration Language (HCL), or optionally JSON.

- Google Cloud Platform

  [Google Cloud Platform (GCP)](https://cloud.google.com/) offers a suite of cloud computing services, including:

  - **Google Cloud Storage**: A scalable object storage service for storing and accessing data.
  - **BigQuery**: A fully managed, serverless data warehouse for analytics.
  - **Google Compute Engine**: Infrastructure-as-a-service (IaaS) virtual machines (VMs) for running workloads on Google's infrastructure.

- Mage

  [Mage](https://www.mage.ai/) is a powerful orchestration tool that allows developers to define and automate tasks using Go code. It is designed to simplify the process of building, testing, and deploying software projects by providing a flexible and extensible framework for defining custom workflows.

- Data Build Tool (dbt)

  [dbt](https://www.getdbt.com/) is a data transformation tool that enables analysts and engineers to transform data in their warehouse more effectively.

- Looker Studio

  [Looker Studio](https://looker.com/platform/studio) is a free tool that turns your data into informative, easy-to-read, easy-to-share, and fully customizable dashboards and reports.


---

## Data Architecture

<p align="center">
  <img src="images\dfd.jpg">
</p>

---

### Replication of the Project

Replication steps are given in accordance with Windows OS and Google Cloud Platform.

**Steps to be followed:**

1. **Create an SSH key to login to the virtual machine created**
   - Open Git Bash
   - Navigate to the SSH directory using `cd ~/.ssh`
   - Use this command to create an SSH key:
     ```
     ssh-keygen -t rsa -f ~/.ssh/KEY_FILENAME -C USERNAME -b 2048
     ```
     where `KEY_FILENAME` is the key name and `USERNAME` will be your name
2. **Upload the public SSH key to GCP**
   - Before uploading the SSH key, enable Compute API, Storage API, and BigQuery API on Google Cloud Platform.
   - Copy the contents of the public SSH key created in the previous step.
   - Under the Navigation Menu, go to Compute Engine. If you scroll under Compute Engine, you should be able to find a tab named Metadata. Click on it. Click on the SSH KEYS tab. Add the copied contents from the public SSH key and save. Whichever instance is created now can be logged in via the same SSH key.
3. **Create the VM on GCP**
   - Under Compute Engine, click on VM instances and then Create Instance.
   - Specify an instance name if required. Change the location if required. The type of instance chosen is 'e2-standard-4' which has 4 vCPU, 2 cores, and 16 GB of RAM.
   - Under Boot disk, change the Operating System to Ubuntu and the version to Ubuntu 20.04 LTS. Increase the size to 30 GB. Click on create to create the VM instance.
4. **Create Service account on GCP**
   - Under the Navigation Menu, hover over IAM and Admin and select Service Accounts.
   - Click on CREATE SERVICE ACCOUNT. Give a Service Account name and description. The account ID should be populated automatically. Click on create and continue.
   - In the second step select all the roles required. For this project, we require the 'Storage Admin' and 'BigQuery Admin' roles. Add these 2 roles and click on done.
   - Now you can see the created service account. Now click on actions and then manage keys. Click on add key and select Create new key. Select the format as JSON and a JSON file will be downloaded into your local machine. Keep this key safe.
5. **Login to the VM**
   - We can login to the created VM using SSH and the private key created using the command:
     ```
     ssh -i ~/.ssh/KEY_FILENAME USERNAME@IP_OF_THE_VM
     ```
     where `KEY_FILENAME` and `USERNAME` are the arguments given during the SSH key creation, and `IP_OF_THE_VM` is the External IP address of the VM instance created. Click yes when prompted to add the IP address to known hosts.
   - We can make it easier to login by editing the config file in the SSH folder. We can add this in the config file:
     ```
     Host de-zoomcamp
     Hostname 34.31.208.86
     User abhi
     IdentityFile c:/Users/bhind/.ssh/gcp
     ```
     where `Host` is the name used to login, `Hostname` is the external IP of the VM, `User` is the Username of the SSH key, and `IdentityFile` is the location of the private SSH key.
   - Once the config file is saved, we can login to the VM using the `ssh de-zoomcamp` command.
   - We can also use VS Code for simpler file operations. We need to install the SSH-Terminal extension in VS Code, then connect to the VM and we get the file explorer and editor for the VM. This makes many tasks very simple.
6. **Install Anaconda on VM**
7. **Git clone this repository.**
8. **Install Terraform. Install Unzip. Add bin to path.**
9. **Send service account key to VM.**
10. **Install required packages.**
---
