// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "https://unpkg.com/@hotwired/turbo@8.0.4/dist/turbo.es2017-esm.js"
import "jquery"
import "@popperjs/core"
import "bootstrap"

// Make jQuery available globally
window.$ = window.jQuery = jQuery;

// Test jQuery is working
document.addEventListener('DOMContentLoaded', function() {
  console.log('jQuery version:', $.fn.jquery);
  console.log('Bootstrap loaded:', typeof bootstrap !== 'undefined');
});