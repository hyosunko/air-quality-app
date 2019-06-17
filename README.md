# Air Quality App

Air Quality using Rails

### Built With

* [Rails](https://rubyonrails.org/)
* [Bootstrap](https://getbootstrap.com)

### Installing

A step by step installation process

1. Clone the github repo
```sh
git clone https://github.com/hyosunko/air-quality-app.git
```
2. Install Gems
```sh
bundle install
```
3. get api key from https://docs.airnowapi.org/

4. create .env file and save api key inside .env file
```sh
AQI_API_KEY="Your-AirNow-API-KEY"
```
5. Update bundle
```sh
bundle install
```
6. Start rails server
```sh
rails server
```
7. Open browser
```sh
http://localhost:3000
```

## Deployment

Heroku is the best place to deploy rails app. Please refer [Heroku](https://devcenter.heroku.com/articles/getting-started-with-rails5) documentation

Add AQI_API_KEY in Config Vars after deploying on Heroku.

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags).

## Authors

* **H. Michael Ko** - *Initial work* - [AirQuaityApp](https://github.com/hyosunko/air-quality-app)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

