# WSUSCleanup
Documentation for WSUS Cleanup PowerShell Script

This PowerShell script is designed to automate the cleanup of the Windows Server Update Services (WSUS) database by removing obsolete and unnecessary updates, computer objects, and content files. The script can be scheduled to run automatically using the Windows Task Scheduler or other scheduling software.

Variables

The script uses one variable to specify the WSUS server hostname:

$hostname_srv - The hostname of the WSUS server.

Execution

The script begins by setting the hostname of the WSUS server and creating a log file to track the cleanup process. It then performs the following cleanup tasks using the WSUS PowerShell module:

Remove obsolete computers
Remove obsolete updates
Decline superseded updates
Decline expired updates
Remove unneeded content files
Compress updates
After each cleanup task is completed, the script logs the output to the log file. It then counts the number of approved updates and logs the count to the log file as well.

If an error occurs during the cleanup process, the script logs the error message to the log file.

The script then generates an HTML email body that includes the output of each cleanup task and the count of approved updates. It attaches the log file to the email and sends the email using the specified SMTP server.

To import the script into the Task Scheduler, create a new task and select the PowerShell script as the action to be executed. In the "Add arguments" field, enter the full path to the script file. In the "Start in" field, enter the directory containing the script file. The script can then be scheduled to run at the desired interval.

Languages

This documentation is provided in English and Russian.

Документация для PowerShell-скрипта WSUS Cleanup

Этот PowerShell-скрипт предназначен для автоматизации очистки базы данных службы обновления Windows Server (WSUS) путем удаления устаревших и ненужных обновлений, объектов компьютеров и файлов контента. Скрипт может быть запланирован для автоматического выполнения с помощью Планировщика задач Windows или другого программного обеспечения для планирования.

Переменные

Для выполнения скрипта используется одна переменная для указания имени хоста сервера WSUS:

$hostname_srv - Имя хоста сервера WSUS.

Выполнение

Скрипт начинается с установки имени хоста сервера WSUS и создания файла журнала для отслеживания процесса очистки. Затем он выполняет следующие задачи очистки с использованием модуля PowerShell WSUS:

Удалить неактуальные компьютеры
Удалить неактуальные обновления
Отклонить устаревшие обновления
Отклонить просроченные обновления
Удалить ненужные файлы контента
Сжать обновления
После завершения каждой задачи очистки скрипт записывает вывод в файл журнала. Затем он подсчитывает количество утвержденных обновлений и также записывает количество в файл журнала.

Если в процессе очистки происходит ошибка, скрипт записывает сообщение об ошибке в файл журнала.

Затем скрипт генерирует тело электронной почты в формате HTML, которое включает вывод каждой задачи очистки и количество утвержденных обновлений. Он прикрепляет файл журнала к электронной почте и отправляет электронную почту с использованием указанного сервера SMTP.

Чтобы импортировать скрипт в Планировщик задач, создайте новую задачу и выберите PowerShell-скрипт в качестве действия, которое будет выполнено. В поле "Add arguments" введите полный путь к файлу скрипта. В поле "Start in" введите каталог, содержащий файл скрипта. Затем скрипт может быть запланирован для выполнения с заданным интервалом.

Языки

Эта документация предоставляется на английском и русском языках.
