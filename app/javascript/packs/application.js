// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// ----------------------------------------------------
// Note: ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// Tailwind import
import "../stylesheets/application"

// Internal imports, e.g:
import "controllers";
import initAlerts from '../components/init_alerts';
import initNavbarScroll from '../components/init_navbar_scroll';
import initAos from "../plugins/init_aos";
import initMasonry from "../plugins/init_masonry";
import initTippy from "../plugins/init_tippy";
import { fireSweetAlert } from "../utils/fire_sweet_alert";
import { initProgressBar } from "../components/init_progress_bar"


document.addEventListener('turbolinks:load', () => {
  initAlerts();
  initNavbarScroll();
  initAos();
  initMasonry();
  fireSweetAlert();
  initTippy();
  initProgressBar();
});



