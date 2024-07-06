# thetechravens
Rails project with RSpec

# Inventory Management System

## Setup Instructions

1. **Clone the repository:**

    ```sh
    git clone <repository_url>
    cd thetechravens
    ```

2. **Install dependencies:**

    ```sh
    bundle install
    ```

3. **Set up the database:**

    Ensure MySQL is installed and running on your local machine. Set up a MySQL user with the following credentials:

    ```
    Username: root
    Password: Root$123
    ```

    Update the `config/database.yml` file with the MySQL configuration if necessary.

4. **Create and migrate the database:**

    ```sh
    rails db:create
    rails db:migrate
    ```

5. **Run the application:**

    ```sh
    rails s
    ```

    Open your web browser and go to `http://localhost:3000` to view the application.

6. **Run RSpec tests:**

    To run the RSpec tests, use the following commands:

    ```sh
    bundle exec rspec
    ```

    or

    ```sh
    rspec
    ```

## Application Overview

The Inventory Management System allows you to manage products within a warehouse. The system supports the following functionalities:

- **Create a new product:** Add a new product to the inventory with a unique SKU, name, price, and stock quantity.
- **Update existing product details:** Modify the details of an existing product.
- **Delete a product:** Remove a product from the inventory.
- **List all products:** View all products in a tabular format with their details.

## Validation

The application ensures the following validations for products:

- The SKU is unique across the system.
- All required fields (name, SKU, price, stock quantity) are present before saving a product.

## User Interface

The application uses simple forms and tables to manage the inventory. Bootstrap is used to enhance the UI elements while keeping the styling minimal.

## Testing

RSpec is used for testing the application. The test cases cover model validations and at least one controller action for each CRUD operation.
