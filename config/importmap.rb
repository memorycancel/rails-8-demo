# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "trix"
pin "@rails/actiontext", to: "actiontext.esm.js"
pin "local-time" # @3.0.3
pin "bootstrap" # @5.3.6
# 执行 bin/importmap pin bootstrap 后，popperjs 有 bug
# 参考：https://github.com/rails/importmap-rails/issues/65
pin "@popperjs/core", to: "stupid-popper-lib-2024.js"
