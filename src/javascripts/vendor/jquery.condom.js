/* 
 * jQuery Condom (Use namespaces to protect your global integrity.) 
 * Version 0.0.1 
 * 
 * Copyright (c) 2011 Mario "Kuroir" Ricalde (http://kuroir.com)  
 *   & Micha Niskin (micha@thinkminimo.com) 
 * Licensed jointly under the GPL and MIT licenses, 
 * choose which one suits your project best! 
 */ 
(function($) { 
  var methods = {}; 
  $.ns = function(ns) { 
    // Define namespace if it doesn't exist.
    methods[ns] =  methods[ns] || {}; 
    return { 
      // Add a method.
      add: function(fname, fn) { 
        var new_funcs = typeof fname == "object" ? fname : {}; 
        // One method.
        if (new_funcs !== fname) 
          new_funcs[fname] = fn; 
        // Group of methods.
        $.each(new_funcs, function(fname, fn) { 
          methods[ns][fname] = function() { 
            fn.apply(this, arguments); 
            return this; 
          }; 
        }); 
        return this; 
      },
      // Get methods.
      methods: function() { 
        return $.extend({}, methods[ns]); 
      } 
    }; 
  };
  // The only function that touches $.fn
  $.fn.ns = function(ns) { 
    if (methods[ns]) $.extend(this, methods[ns]); 
    return this; 
  }; 
})(jQuery);