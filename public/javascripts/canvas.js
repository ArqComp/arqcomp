// JavaScript Document

var canvasList = [];

var allHTMLTags = new Array();

//Create Array of All HTML Tags
var allHTMLTags=document.getElementsByTagName("*");

//Loop through all tags using a for loop
for (i=0; i<allHTMLTags.length; i++) {

	//Get all tags with the specified class name.
	if (allHTMLTags[i].className=="canvasBall") {

		var canvas = allHTMLTags[i];

		if (canvas && canvas.getContext) {
			var context = canvas.getContext('2d');

			canvas.addEventListener('mouseover', function(e){e.target.mouseInSpeed=0.05}, false); 						
			canvas.addEventListener('mouseout', function(e){e.target.mouseInSpeed=0; e.target.mouseIn=0}, false);
										
			setInterval( TimeUpdate, 20 );
	
			context.beginPath();
			var particles = eval('('+canvas.textContent+')');
			/*var particles = [];
			for( var i = 0; i < 10; i++ ) {
				var size = 20+Math.random()*10;
				particles.push( { 
					centerX: Math.random()*canvas.width,
					centerY: Math.random()*canvas.height,
					x:0, 
					y:0,
					radius: size+Math.random()*100,
					angle: Math.random()*Math.PI*2,
					speed: (Math.random() > .5 ? 1 : -1) * 0.03,
					size: size,
					color: "rgba(200,200,200,0.5)"
				} );
			}*/

			img = new Image();
			img.src = canvas.attributes.img.textContent;
			//img.src = "circuito.jpg";						
			imggray = new Image();
			//imggray.src = "circuito.jpg";							
			imggray.src = canvas.attributes.imggray.textContent;

			canvas.mouseIn = 0;
			canvas.mouseInSpeed = 0;
			canvasList.push( {
				canvas: canvas,
				context: context,
				particles: particles,
				img: img,
				imggray: imggray
			} );
		}


	}

}						

function TimeUpdate(e) {
	for( var k = 0; k < canvasList.length; k++ ) {
		var context = canvasList[k].context;
		var canvas = canvasList[k].canvas;
		var particles = canvasList[k].particles;
		var img = canvasList[k].img;
		var imggray = canvasList[k].imggray;
		context.clearRect(0, 0, window.innerWidth, window.innerHeight);
		context.globalAlpha = 1;

		//if (canvas.mouseIn == -0.01) {
//						context.drawImage(imggray, 0, 0, canvas.width, canvas.height);	
			
			/*var imageData = context.getImageData(0, 0, canvas.width, canvas.height);
			var px = imageData.data;
			for(var i = 0; i < px.length; i += 4) {						
				var brightness = (3 * px[i] + 4 * px[i + 1] + px[i + 2])>>>3;
				
				px[i] = px[i + 1] = px[i + 2] = brightness;
			}
			context.putImageData(imageData, 0, 0);
			*/

//				} else {
			
			context.drawImage(imggray, 0, 0, canvas.width+5*canvas.mouseIn, canvas.height+5*canvas.mouseIn);

		//context.drawImage(imggray, 0, 0, canvas.width, canvas.height);	
		
		context.globalAlpha = canvas.mouseIn;
		if ((canvas.mouseIn < 1.01 && canvas.mouseInSpeed > 0) || (canvas.mouseIn > 0.05 && canvas.mouseInSpeed < 0)){
			canvas.mouseIn += canvas.mouseInSpeed;
		}
		//context.drawImage(img, 0, 0, canvas.width,	canvas.height);		
context.drawImage(img, 0, 0, canvas.width+5*canvas.mouseIn,	canvas.height+5*canvas.mouseIn);					
		for( var i = 0; i < particles.length; i++ ) {

			function calculaX(Px, Py) { 
				return particles[i].centerX + Math.cos(particles[i].angle)*(Px) - Math.sin(particles[i].angle)*(particles[i].radius + Py);
			}

			function calculaY(Px, Py) { 
				return particles[i].centerY + Math.sin(particles[i].angle)*(Px) + Math.cos(particles[i].angle)*(particles[i].radius + Py);
			}					

			particles[i].x = calculaX(0, 0); 
			particles[i].y = calculaY(0, 0); 

			var x1 = calculaX(0, -0.5*particles[i].size); 
			var y1 = calculaY(0, -0.5*particles[i].size); 

			var x2 = calculaX(-0.3*particles[i].size, 0.3*particles[i].size);  
			var y2 = calculaY(-0.3*particles[i].size, 0.3*particles[i].size);  

			var x3 = calculaX(0.3*particles[i].size, 0.3*particles[i].size); 
			var y3 = calculaY(0.3*particles[i].size, 0.3*particles[i].size); 

			particles[i].angle += particles[i].speed;

			context.strokeStyle = "#FFFFFF";
			context.lineWidth = 3;
			context.beginPath();	
			context.lineTo(particles[i].x, particles[i].y);
			context.lineTo(x3,y3);
			context.lineTo(x1,y1);
			context.lineTo(x2,y2);
			context.lineTo(particles[i].x, particles[i].y);
			context.stroke();

			/*context.strokeStyle = "#000000";
			context.lineWidth = 2;
			context.beginPath();	
			context.lineTo(particles[i].x, particles[i].y);
			context.lineTo(particles[i].centerX, particles[i].centerY);
			context.stroke();
			*/
			context.fillStyle = particles[i].color;
			context.beginPath();
			context.arc(particles[i].x,particles[i].y,particles[i].size,0,Math.PI*2,true);
			context.closePath();
			context.fill();
//					}
		}
	}
}