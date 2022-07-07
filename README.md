# simplebank

## Simple bank service
The service that we’re going to build is a simple bank. It will provide APIs for the frontend to do following things:

1. Create and manage bank accounts, which are composed of owner’s name, balance, and currency.
2. Record all balance changes to each of the account. So every time some money is added to or subtracted from the account, an account entry record will be created.
3. Perform a money transfer between 2 accounts. This should happen within a transaction, so that either both accounts’ balance are updated successfully or none of them are.

## DB diagram

![Bank](https://user-images.githubusercontent.com/70756496/177759791-f45b693c-0d6d-448e-a89b-8b97e3eae827.png)

DB part was written using Postgres and run through a docker container.

## How to get start
Clone the project to the server directory:

`git clone https://github.com/M1racle-Heen/simplebank.git`

### You need to install

- [Docker desktop](https://www.docker.com/products/docker-desktop)
- [Golang](https://golang.org/)
- [Migrate](https://github.com/golang-migrate/migrate/tree/master/cmd/migrate)

    ```bash
    brew install golang-migrate
    ```
    
- [Sqlc](https://github.com/kyleconroy/sqlc#installation)

    ```bash
    brew install sqlc
    ```

- [Gomock](https://github.com/golang/mock)

    ``` bash
    go install github.com/golang/mock/mockgen@v1.6.0
    ```
## Setup details

- Start postgres container:
    
    ``` bash
    make postgres    
    ```
    
- Start simple_bank database:
    
    ``` bash
    make createdb    
    ```
    
- Run db migration up all versions:
    
    ``` bash
    make migrateup    
    ```
    
- Run db migration up 1 version:
    
    ``` bash
    make migrateup1    
    ```

- Run db migration down all versions:
    
    ``` bash
    make migratedown   
    ```
    
- Run db migration down 1 version:
    
    ``` bash
    make migratedown1    
    ```
## How to run
- Run server:
    
    ``` bash
    make server
    ```
- Run test:

    ``` bash
    make test
    ```
## Hot to generate code
- Generate SQL CRUD with sqlc:
    
    ``` bash
    make sqlc
    ```
- Generate DB mock with gomock:
    
    ``` bash
    make mock
    ```
## How to test

You can download the great tool [Postman](https://www.postman.com/)
To test methods from App
