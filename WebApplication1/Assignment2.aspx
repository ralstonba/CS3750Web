<!DOCTYPE html>
<html>
<head>
    <title>Assignment 2</title>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="Scripts/jquery.signalR-2.2.2.min.js"></script>
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
        I should should graph here
    </div>

    <script src="signalr/hubs"></script>
    <script type="text/javascript">
        $(function () {
            var quiz = $.connection.quizHub;
            quiz.client.updateGraph = function (voteJSON) {
                $("#graphDiv").text(voteJSON);
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
