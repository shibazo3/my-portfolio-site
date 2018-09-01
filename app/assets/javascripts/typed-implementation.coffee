ready = ->
  Typed.new '.element',
    strings: [
      "Hi! I'm Tsubasa Shibata."
      "I've made this site to practice web development and as my portfolio."
      'I hope you can be know about me in detail.'
      'Please have a look!'
    ]
    typeSpeed: 0,
    loop: true,
  return

$(document).ready ready
$(document).on 'turbolinks:load', ready