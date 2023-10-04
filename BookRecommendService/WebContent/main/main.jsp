<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Page Title</title>
    <!-- Add your CSS styles here -->
    <style>
        /* Define your CSS styles for layout, sizing, and appearance */
        body {
            margin: 0;
            padding: 0;
        }

        #top {
            height: 180px; /* Auto height to fit content */
            width: 100%;
            background-color: #f0f0f0; /* Set your desired background color */
            position: relative;
    		overflow: hidden; /* 추가 */	
        }

       #left {
		    width: 150px;
		    height: 80vh;
		    float: left;
		    background-color: #e0e0e0; /* Set your desired background color */
		}

        #right {
            margin-left: 150px; /* Match the width of the left frame */
            height: 80vh;
            background-color: #ffffff; /* Set your desired background color */
            position: relative; /* 추가 */
        }
    </style>
</head>
<body>
    <div id="top">
        <!-- Include your top.html content here -->
        <iframe id="top-iframe" src="<%=request.getContextPath() %>/main/top.html" frameborder="0" width="100%" name="top"></iframe>
    </div>
    <div id="left">
        <!-- Include your left.jsp content here -->
        <iframe src="<%=request.getContextPath() %>/main/left.jsp" frameborder="0" width="100%" height="100%" name="left"></iframe>
    </div>
    <div id="right">
        <!-- Include your bookListPaging.jsp content here -->
        <iframe src="<%=request.getContextPath() %>/main/bookListPaging.jsp" frameborder="0" width="100%" height="100%" name="right"></iframe>
    </div>

    <script>
        // JavaScript to adjust the height of the top iframe based on its content
        function adjustIframeHeight() {
            var iframe = document.getElementById('top-iframe');
            if (iframe) {
                iframe.style.height = iframe.contentWindow.document.body.scrollHeight + 'px';
            }
        }

        // Call the adjustIframeHeight function initially and on window resize
        window.addEventListener('load', adjustIframeHeight);
        window.addEventListener('resize', adjustIframeHeight);
    </script>
</body>
</html>
