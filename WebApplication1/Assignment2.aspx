<!DOCTYPE html>
<html>
<head>
    <title>Assignment 2</title>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="Scripts/jquery.signalR-2.2.2.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
</head>
<body>
    <div id="inputForm">
        <form>
            <fieldset>
                <legend>
                    Select your favorite drink
                </legend>
                <div>
                    <input type="radio" id="pepsi" value="pepsi" name="drink" checked />
                    <label for="pepsi">Pepsi</label>
                </div>
                <div>
                    <input type="radio" id="coke" value="coke" name="drink" />
                    <label for="coke">Coke</label>
                </div>
                <div>
                    <input type="radio" id="mtndew" value="mtndew" name="drink" />
                    <label for="mtndew">Mountain Dew</label>
                </div>
                <div>
                    <input type="radio" id="other" value="other" name="drink" />
                    <label for="other">Other</label>
                </div>
                <div>
                    <input type="button" id="submitDrink" value="Submit" />
                </div>
            </fieldset>
        </form>
    </div>

    <div id="graphDiv" hidden>
        <canvas id="canvas"></canvas>
    </div>

    <script src="signalr/hubs"></script>
    <script type="text/javascript">
        $(function () {
            var quiz = $.connection.quizHub;
            quiz.client.updateGraph = function (voteJSON) {
                voteJSON = JSON.parse(voteJSON);
                var labels = Object.keys(voteJSON);
                var data = Object.values(voteJSON);

                var ctx = canvas.getContext('2d');

                var options = {
                    responsive: false
                }

                var config = {
                    type: 'doughnut',
                    data: {
                        labels: labels, //["Red", "Yellow", "Blue"],
                        datasets: [{
                            data: data, //[10, 20, 30],
                            //backgroundColor: ["Red", "Yellow","Blue"]
                        }]
                    },
                    options: options
                };

                var chart = new Chart(ctx, config);
            };
            $.connection.hub.start().done(function () {
                $('#submitDrink').click(function () {
                    quiz.server.updateCounts($("input[name=drink]:checked").val()); 
                    $("#inputForm").hide();
                    $("#graphDiv").show();
                });
            });
        });
    </script>
</body>
</html>
