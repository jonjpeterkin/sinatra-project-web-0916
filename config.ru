require_relative 'config/environment'

use Rack::MethodOverride
use RestaurantsController
use UsersController
run ApplicationController
