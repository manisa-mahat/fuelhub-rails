# FuelHub Petroleum Software

This project is all about dispatching petroleum products to the end consumer in a systematic way.

## Problem Statement

The dispatching of petroleum products often relies on manual record-keeping, which can be inefficient and error-prone. This project aims to streamline the tracking of products dispatched to end consumers, allowing dispatchers to maintain systematic records of consumer demands. The application will enable organizations to monitor product status, as well as consumer details and outlet information, providing a centralized platform for tracking their operations effectively.

## Authors

**Backend Developers**
- [Sandesh Bist](https://github.com/MrBist36)
- [Manisha Mahat](https://github.com/manisa-mahat)
- [Sushil Awasthi](https://github.com/sushilawasthi)

**FrontEnd Developer**
- [Manju Bhandari](https://github.com/Manju166)

## Proposed Solution

We propose developing an application to automate and streamline the dispatching of petroleum products. Key features include:

1. **User-Friendly Dashboard**: Real-time overview of product status and consumer demands.
2. **Automated Record Management**: Eliminate manual data entry for dispatches and requests.
3. **Product Tracking**: Monitor products from dispatch to delivery.
4. **Consumer Database**: Store and manage information on consumers and outlets.
5. **Order Group Creation and Recurring Orders**: Create order groups based on consumer demand and set them to recur at specified intervals.
6. **Mobile Accessibility**: Access and manage operations on-the-go.

This solution enhances tracking accuracy, operational efficiency, and customer satisfaction.

## Approach

This application is designed with a multi-tenant architecture using the `acts_as_tenant` gem to ensure tenant-specific resource management. Built on Rails, it integrates GraphQL to handle user registration, authentication, and resource management (such as products and customers) across various tenants.

Key operations, like creating and updating products, are encapsulated in service objects (e.g., `ProductService`) for a clean separation of business logic. The app enforces strict tenant isolation, ensuring that users can only access data associated with their own tenant.

Development is containerized using Docker, with PostgreSQL as the database.

## Features

**Following operations can be performed by users of the organization logged into this software:**
- Perform CRUD (Create, Read, Update, Delete) operations for Products.
- Perform CRUD operations for Consumers.
- Perform CRUD operations for Consumer Outlets.
- Perform CRUD operations for Resources.
- Perform CRUD operations for Drivers.
- Perform CRUD operations for Order Groups.
- Perform CRUD operations for Deliver Orders.
- Perform CRUD operations for Line Items.
- Perform recurring operations for a certain duration for Order Groups, where Deliver Orders and Line Items are nested.
- Mail feature for Order Group creation.
- CSV import and upload feature.

## Technologies Used

- **Ruby on Rails**: Web framework for building the core application.
- **GraphQL**: For flexible, efficient data querying and mutation handling.
- **acts_as_tenant**: Manages multi-tenancy in the application.
- **PostgreSQL**: Relational database for storing application data.
- **Sidekiq**: Background job processing.
- **Docker**: Containerization for development environment.
- **Devise**: User authentication management.
- **Rspec**: Testing framework for automated tests.
- **Active Storage**: For managing file uploads (e.g., profile pictures).
- **Insomnia**: API testing tool for testing GraphQL queries and mutations.
- **GitHub**: Version control and collaboration.
- **VS Code**: Code editor for writing and debugging the project.
- **Devcontainer**: VS Code integrated environment for consistent development using Docker containers.
- **ngrok**: Tunneling service to expose the backend API to the frontend for local development.

## Run Locally

To run this project locally, follow these steps:

### Prerequisites

Make sure you have the following installed on your machine:
- **Docker** (for containerized development)
- **Postgres** (for the database)
- **DevContainer** (for consistent development using Docker)
- **Git** (for version control)
- **Insomnia** (optional, for testing GraphQL API queries)
- **ngrok** (to expose the backend API to the frontend for local development)

### Clone the repository

```bash
git clone https://github.com/manisa-mahat/fuelhub-rails.git
```
### traverse to project directory

```bash
  cd fuelhub-rails
```
```bash
  code .
```
Your Docker setup will execute this project within the devcontainer environment.

### Run the app
```bash
  rails s
```

### Use Graphql for testing the API in browser
- http://localhost:3000/graphiql

### Launch ngrok to connect the API to the frontend.
- Add this to your terminal
```bash
  ngrok http 3000 #give the port where server is running locally.
```
Share the ngrok link with the frontend, ensuring it includes the ngrok forwarding address. The project is ready—run it locally and enjoy discovering this masterpiece!

## Support
For support contact, email @ sandeshbist36@gmail.com
email @ sushilawasthi22@gmail.com
email @ mahatmanisha1555@gmail.com
email @ manjubhandariabcd@gmail.com

## Thank You!

Thank you for taking the time to explore this project. Your interest and support are greatly appreciated!
