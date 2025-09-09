# DBT + Redshift Project

## Setup

1. Install dbt-core and dbt-redshift.
2. Create a `profiles.yml` file in your `~/.dbt/` directory with your Redshift credentials:

```yaml
my_project:
  target: dev
  outputs:
    dev:
      type: redshift
      host: <your-cluster>.redshift.amazonaws.com
      user: <username>
      password: <password>
      dbname: <database>
      schema: <schema>
      port: 5439
