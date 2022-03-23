# README

In diesem Repository liegen eine Frontend-Anwendung und eine Rails-API-Anwendung. Die Rails-API liegt im Root-Folder, das Web-Frontend liegt im `frontend`-Ordner.

Die Anwendung wird mit Hilfe von Kubernetes und einer automatisierten Github-Pipeline deployed. Die entsprechenden Dateien liegen im `manifests`-Ordner. 

Aktuell wird die Anwendung auf die Oracle Cloud-Infrastruktur deployed: Bei Bedarf kann die Anwendung aber auch ohne Probleme auf andere Cluster übertragen werden.


## Project Setup

To set up your local development environment, the following dependencies must be installed:

1. Install `asdf` or another version manager of your choice if you haven't already. Follow [asdf-Docs](https://asdf-vm.com/guide/getting-started.html#_1-install-dependencies) for installation.
2. Clone the project with `git clone git@github.com:jkimmeyer/microbrewers.git` and move into the project directory with `cd microbrewers`.
3. Add asdf plugins for ruby and nodejs with `asdf plugin add ruby && asdf plugin add yarn`.
4. Install the correct ruby version and nodejs version with `asdf install`. This uses the versions from the [.tool-versions](.tool-versions) file.
5. Install yarn with `npm install -g yarn`. Now `asdf list`should display the versions from .tool-versions.
8. Install Postgresql with `brew install postgresql` or use a docker service.
9. Install bundler with `gem install bundler`
10. Run `bundle install` and `cd frontend && yarn install` followed by `bundle exec rails db:setup` to install gems, javascript packages and setup the development and test databases.In case the connection is refused when setting up the database, try `brew services restart postgresql`.
11. Copy `.env.sample` to `.env.development`
12. For the DEVISE_KEY in the development file generate a random string with `rails secret`
13. To fill out the rest ask me for all necessary variables

Now, you can start the local development server.
Start the frontend `cd frontend && yarn run dev` in one terminal, and run `bundle exec rails server` in the other terminal.
