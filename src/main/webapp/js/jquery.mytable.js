(function($){
	$.fn.mytable=function(options){
		var defaults={
				evenRowClass:"evenRow",
				oddRowClass:"oddRow",
				activeRowClass:"activeRow"
		};
		var options=$.extend(defaults,options);
		this.find("tr:even").addClass(options.evenRowClass);   //在this.each里  this指DOM元素
		this.find("tr:odd").addClass(options.oddRowClass);
		$(this).find("tr").bind("mouseover",function(){
			$(this).addClass(options.activeRowClass);
		});
		$(this).find("tr").bind("mouseout",function(){
			$(this).removeClass(options.activeRowClass);
		});
		
		
	};
	
})(jQuery);
$.fn.mytable.prototype.d="";