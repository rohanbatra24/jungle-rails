# Jungle

A mini e-commerce application built with Rails 4.2. 

## Final Product

!["Main page"](https://github.com/rohanbatra24/scheduler/blob/master/docs/Main%20page.png?raw=true)
!["Create new appointment"](https://github.com/rohanbatra24/scheduler/blob/master/docs/Create%20new%20appointment.png?raw=true)
!["Appointment on hover"](https://github.com/rohanbatra24/scheduler/blob/master/docs/Appointment%20on%20hover.png?raw=true)
!["Delete confirmation"](https://github.com/rohanbatra24/scheduler/blob/master/docs/Delete%20confirmation.png?raw=true)



## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
