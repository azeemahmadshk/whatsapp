// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require jquery3
//= require popper
//= require bootstrap-sprocket

//= require lib/spin.min
//= require lib/loading_animation
//= require lib/bootstrap-filestyle.min
//= require bootstrap-sprockets
//= require bootstrap-datepicker
//= require bootstrap-switch
//= require autocomplete-rails
//= require introjs
//= require geocomplete
//= require owl.carousel
//= require bootstrap-toggle-buttons
//= require typeahead.bundle.min
//= require jquery.mCustomScrollbar.concat.



//= require rooms/index
//= require jquery2


//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree



require("@rails/activestorage").start()
require('jquery')
import {$} from 'jquery-ujs'
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
require("channels/chat_channel")
Rails.start()
Turbolinks.start()
ActiveStorage.start()

