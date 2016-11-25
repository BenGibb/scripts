// ==UserScript==
// @name         Remove sponsored content from Pocket
// @namespace    https://zblesk.net/blog
// @version      0.92
// @description  Surprisingly, it removes sponsored content from Pocket.
// @author       zblesk
// @match        https://getpocket.com/a/queue/
// @grant        none
// @run-at       document-idle
// ==/UserScript==

(function() {
    'use strict';
    console.log('Removing all ' + $(".spoc").length + ' items with the "spoc" class.');
    $(".spoc").hide();
})();