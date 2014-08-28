(function($){
	$.fn.mytable=function(options){
		var defaults={
				evenRowClass:"evenRow",
				oddRowClass:"oddRow",
				activeRowClass:"activeRow"
		};
		var options=$.extend(defaults,options);
		this.find("tr:even").addClass(options.evenRowClass);   //��this.each��  thisָDOMԪ��
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