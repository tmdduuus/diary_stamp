<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Diary Calendar</title>
    <style>
        /* 기본 캘린더 스타일링 */
        .calendar-table {
            width: 100%;
            border-collapse: collapse;
        }

        .calendar-table th, .calendar-table td {
            border: 1px solid black;
            text-align: center;
            padding: 5px;
        }

        .diary-present {
            background-color: #90ee90; /* 데이터가 있는 날짜 */
        }
    </style>
</head>
<body>
    <h2>Diary Calendar</h2>
    <table class="calendar-table" id="calendar">
        <!-- 캘린더 헤더 및 날짜 자리 -->
    </table>

    <script>
        var diaryEntries = JSON.parse('${calendarData}');

        function generateCalendar(year, month) {
            var calendar = document.getElementById('calendar');
            // 캘린더 생성 로직 구현
        }

        function markDiaryDates() {
            diaryEntries.forEach(function(entry) {
                if (entry.diaryExists) {
                    var dateElement = document.querySelector('#calendar .date-' + entry.diaryDate);
                    if (dateElement) {
                        dateElement.classList.add('diary-present');
                    }
                }
            });
        }

        generateCalendar(2024, 2); // 예시 연도와 월
        markDiaryDates();
    </script>
</body>
</html>
