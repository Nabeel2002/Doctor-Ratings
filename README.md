# DocScore: Doctor Ratings for Insights

## Business Problem

**Company Description:**

Our company is involved in analyzing healthcare, particularly in the evaluation of doctor ratings on platforms like RateMDs. We are interested in providing insights or services related to these ratings, possibly to improve patient experiences or assist healthcare providers in understanding their online reputations.

**Requirements:**

Evaluation of doctor ratings on RateMDs

Utilization of ratings data 

Research on ratings data 

Incorporation of geolocation data for location-based analysis


## Business Impact

**Risks:** Potential risks may include inaccuracies in the data, and privacy concerns with handling healthcare data.

**Costs:** Costs may be associated with acquiring and processing the data, as well as the development and maintenance of the system.

**Benefits:** Our company stands to benefit from improved insights into doctor ratings, potentially leading to better decision-making for patients and healthcare providers. This could enhance patient satisfaction, improve healthcare quality, and positively impact the reputation of our company.

## Business Persona

**The people who will use the system include:**


Patients/Clients: To evaluate or choose new healthcare providers based on ratings

Healthcare providers: To understand their reputation and make improvements if necessary or compare themselves with competitors

Insurers: To decide which healthcare providers to include in their networks as part of risk management strategies and make informed decisions

Administrators or managers in healthcare organizations: To monitor and analyze the performance of their healthcare providers

Researchers or analysts: To conduct further research or analysis on healthcare data for various purposes


## Data
Source Data: RateMd

## Methods

## Data Tools
Python, MongoDB, Alteryx, Snowflake, Domo

**Data Storage:**
We will use MongoDB as our storage for both the raw data and transformed data.

**Data Processing:**
We will transfer our source data in batches, due to the high volume of data into MongoDB. Then, we will convert our raw data into actionable information to fit our business requirements and our data model. Finally, we will serve our transformed data into Domo for visualization that user can identify ratings of doctor locations in the U.S.

**Data Orchestration:**

## Interface

**Dashboard and Visualization on DOMO** 

Best Rating by Specialty and City
![visualization1](https://github.com/Nabeel2002/Doctor-Ratings/assets/160162018/a31448d4-3a84-4203-b764-0548492724de)

Best City for Specialty
![visualization2](https://github.com/Nabeel2002/Doctor-Ratings/assets/160162018/6b04e7db-a0e6-4f00-b68a-5190825fa684)

Average Rating vs Staff Rating
![visualization3](https://github.com/Nabeel2002/Doctor-Ratings/assets/160162018/c93f3ed4-c723-4671-99ea-06b37274420e)



## Contributing

Nabeel Bahrawi 

Jeffery Liu 

Jacky Jiang
