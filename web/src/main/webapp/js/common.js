var native_random = Math.random;
	Math.random = function(min, max, exact) {
	    if (arguments.length === 0)
	    {
	        return native_random();
	    }
	    else if (arguments.length === 1)
	    {
	        max = min;
	        min = 0;
	    }
	    var range = min + (native_random()*(max - min));
	    return exact === void(0) ? Math.round(range) : range.toFixed(exact);
	};