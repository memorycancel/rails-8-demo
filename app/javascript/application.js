// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "trix"
import "@rails/actiontext"

import LocalTime from "local-time"
LocalTime.start()

import * as bootstrap from "bootstrap";

// https://github.com/hotwired/turbo-rails/issues/483
Turbo.StreamActions.redirect_to = function () {
  const url = this.getAttribute('url') || '/'
  Turbo.visit(url)
}
