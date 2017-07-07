### That branch shows some binding error.

Run example in Dartium and take next actions:
 1. Try some buttons (1, 2, or 3) to get idea what info each button present.
 2. Click on First button.
 3. And click on "Break It" button to break that stuff.
 4. Switch back to first record, second and third. Bug here: now First and Third items has same brocken surname.

Code of that button:

    @reflectable
    void btrBreakIt_click(Event e, [_]) {
      var old = controller.selected;
      controller.selected = controller.data[2];
      old.surname = "Broken!!!";

      print('items right after change: ${controller.data.toList()}');

      new Future(() => print('items a bit later: ${controller.data.toList()}'));
    }

Print shows next:

    items right after change: [
      name: 1) First, surname: Broken!!!, 
      name: 2) Second, surname: Griffin, 
      name: 3) Third, surname: Stranger
    ]
    
    items a bit later: [
      name: 1) First, surname: Broken!!!, 
      name: 2) Second, surname: Griffin, 
      name: 3) Third, surname: Broken!!!
    ]
