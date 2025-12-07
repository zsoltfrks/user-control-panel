# Database Integration Guide

This document describes the PostgreSQL database integration for the User Control Panel (UCP) project.

## ⚠️ Security Notice

**IMPORTANT**: The default configuration uses weak credentials for development convenience. Before deploying to any environment:

1. **NEVER commit `.env` or `docker-compose.override.yml` files** - they contain sensitive credentials
2. **Change all default passwords** - use strong, randomly generated passwords
3. **Generate new JWT secrets** - use `openssl rand -hex 32` or similar
4. **Use environment variables** - for production deployments
5. **Review the Production Considerations section** below

## Overview

The project now includes a fully working PostgreSQL database with:
- Complete table schema for all game entities (accounts, characters, vehicles, interiors, items, licenses, etc.)
- Automatic database initialization via Docker Compose
- Sample test data for development

## Database Schema

The database includes 39 tables covering:
- **User Management**: accounts, characters, licenses
- **Inventory System**: items, armors
- **Vehicle System**: vehicles with extensive customization options
- **Property System**: interiors, interior_datas, garages
- **Group/Faction System**: groups, groupmembers
- **Economy**: companies, invoices, tickets
- **Communication**: phone tables (phone_datas, phoneads, phonemessages)
- **Game Systems**: farms, animals, safes, peds, and more

### Key Tables

#### accounts
- User account information
- Authentication credentials
- Admin levels and permissions
- Discord integration
- Account restrictions (admin jail, suspension)

#### characters
- Player character data
- Position, inventory, skills
- Status attributes (health, armor, hunger, thirst)
- Jail status and restrictions

#### vehicles
- Vehicle ownership and state
- Extensive tuning/customization data
- Position and parking data
- Mechanical stats (fuel, oil, health)

#### interiors
- Property ownership
- Interior/exterior positions
- Locking and permissions
- Rental system

#### items
- Inventory items
- Equipment and consumables
- Owner tracking (character, vehicle, interior)

#### licenses
- Driver licenses and permits
- Issue and expiry dates
- License status and points

## Quick Start

### 0. Initial Setup (First Time Only)

```bash
# 1. Copy environment file examples
cp backend/.env.example backend/.env

# 2. (Optional) For custom database credentials, create override file
cp docker-compose.override.yml.example docker-compose.override.yml
# Edit docker-compose.override.yml with your secure credentials

# 3. (Optional) Edit backend/.env with matching credentials and secure JWT secret
```

### 1. Start the Database

```bash
docker compose up -d
```

This will:
- Pull the PostgreSQL 15 Alpine image
- Create a new database named `ucpdb`
- Initialize all tables from `backend/postgre-gambit.sql`
- Insert sample test data
- Set up health checks

### 2. Verify Database is Running

```bash
docker ps | grep ucp-postgres
```

You should see the container is up and healthy.

### 3. Connect to the Database

```bash
docker exec -it ucp-postgres psql -U ucpuser -d ucpdb
```

Or use your favorite PostgreSQL client with these credentials:
- **Host**: localhost
- **Port**: 5432
- **Database**: ucpdb
- **Username**: ucpuser
- **Password**: ucppass

## Sample Test Data

The database includes test data for development:

### Accounts
| Username   | Admin Level | Description    |
|------------|-------------|----------------|
| admin_user | 10          | Admin account  |
| test_user  | 0           | Regular user   |

**Password for both accounts**: `password` (hashed with bcrypt)

### Characters
- **John Admin** (owned by admin_user)
  - $100,000 cash, $50,000 in bank
  - 5 vehicle slots, 5 interior slots
  - Admin-level character

- **Jane Player** (owned by test_user)
  - $50,000 cash, $10,000 in bank
  - 2 vehicle slots, 2 interior slots
  - Regular player character

### Vehicles
- **Vehicle #1**: Infernus (Model 411) - owned by John Admin
  - Plate: ADM1N01
  - Red color
  - Full fuel

- **Vehicle #2**: Elegy (Model 562) - owned by Jane Player
  - Plate: USR0001
  - Blue color
  - 80% fuel

### Properties
- **Admin House**: Owned by John Admin - $150,000 value
- **User House**: Owned by Jane Player - $100,000 value

### Items
Each character has:
- 1x Phone
- 1x Wallet
- Sandwiches (5 for admin, 2 for user)
- Water bottles (3 for admin, 2 for user)

### Licenses
Both characters have valid driver licenses.

## Database Configuration

### Environment Variables

The backend uses these environment variables (defined in `backend/.env`):

```bash
DATABASE_URL=jdbc:postgresql://localhost:5432/ucpdb
DATABASE_USERNAME=ucpuser
DATABASE_PASSWORD=ucppass
```

### Application Properties

Spring Boot is configured to use these settings in `backend/src/main/resources/application.properties`:

```properties
spring.datasource.url=${DATABASE_URL}
spring.datasource.username=${DATABASE_USERNAME}
spring.datasource.password=${DATABASE_PASSWORD}
spring.jpa.hibernate.ddl-auto=update
```

## Managing the Database

### Stop the Database

```bash
docker compose down
```

### Reset the Database

To completely reset and reinitialize:

```bash
docker compose down -v  # -v removes volumes
docker compose up -d
```

### View Logs

```bash
docker logs ucp-postgres
```

### Backup the Database

```bash
docker exec ucp-postgres pg_dump -U ucpuser ucpdb > backup.sql
```

### Restore from Backup

```bash
docker exec -i ucp-postgres psql -U ucpuser -d ucpdb < backup.sql
```

## Schema Updates

The SQL schema file is located at `backend/postgre-gambit.sql`. 

### What was fixed:
1. ✅ Added missing `licenses` table definition
2. ✅ Removed MySQL-specific comment syntax (`/*!40101...*/`)
3. ✅ Fixed data type issues (changed `bigINTEGER` to `BIGINT`)
4. ✅ Added comprehensive test data for development

### Making Schema Changes

If you need to modify the schema:

1. Edit `backend/postgre-gambit.sql`
2. Reset the database: `docker compose down -v && docker compose up -d`
3. Verify changes: `docker exec ucp-postgres psql -U ucpuser -d ucpdb -c "\dt"`

**Note**: In production, use proper migration tools like Flyway or Liquibase instead of recreating the database.

## Troubleshooting

### Container Won't Start

Check the logs:
```bash
docker logs ucp-postgres
```

Common issues:
- Port 5432 already in use
- Permission issues with volumes
- SQL syntax errors in initialization script

### Can't Connect to Database

1. Verify the container is running: `docker ps | grep ucp-postgres`
2. Check the container is healthy: `docker inspect ucp-postgres | grep Health`
3. Verify credentials in `.env` file match those in `docker-compose.yml`

### Backend Can't Connect

1. Ensure DATABASE_URL points to `localhost:5432` (not `postgres` service name)
2. Verify `.env` file exists in `backend/` directory
3. Check Spring Boot logs for connection errors

## Production Considerations

Before deploying to production:

1. **Change Credentials**: Update database passwords
2. **Enable SSL**: Configure PostgreSQL to require SSL connections
3. **Set Up Backups**: Implement automated backup strategy
4. **Use Migrations**: Switch to Flyway/Liquibase for schema versioning
5. **Monitor Performance**: Set up query logging and monitoring
6. **Remove Test Data**: Delete the dummy data section from the SQL file
7. **Tune PostgreSQL**: Adjust `shared_buffers`, `work_mem`, etc. for your workload

## Additional Resources

- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [Spring Data JPA Documentation](https://docs.spring.io/spring-data/jpa/docs/current/reference/html/)
- [Docker Compose Documentation](https://docs.docker.com/compose/)
