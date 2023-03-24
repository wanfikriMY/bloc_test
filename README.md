# bloc_test

To test sink and stream approach

using `StreamBuilder` to build the widget with the data.

# Notes 

## Stream data
1. Initialize `StreamController` of data.
   ie: `late StreamController<String> fetchUserDataController;`
2. Create getter of the controller using `StreamSink` and set the `StreamController` in (1) as sink.
   ie: `StreamSink<String> get fetchUserDataSink => fetchUserDataController.sink;`.
3. Broadcast the controller ` fetchUserDataController = StreamController<String>.broadcast();`
4. Create funtion to process the data and fetch the data from the API.
5. use `.add(data)` to add data into the stream so the data will be updated to all listener controller.
   ie: `fetchUserDataSink.add(userData);`

## Listen data
1. Initialize the class of the `StreamController`
   `late BlocWrapper blocWrapper;`
2. to get the data, call the function used to fetch and process data in `initState` if want to fetch in early of screen rendering
` blocWrapper.getUserData();`
3. To render the data use `StreamBuilder` and stream data from stream controller
`blocWrapper.fetchUserDataController.stream`
