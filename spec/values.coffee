describe 'FormsJs.Values', ->
  it 'gets the value of a text box', ->
    setFixtures("<input type='text' name='email' value='me@example.com' >")
    data = { type: 'text', elementSelector: '[name=email]' }

    expect(FormsJs.Values.get(data)).toEqual('me@example.com')

  it 'gets the value of a select list', ->
    setFixtures("<select name='interest'><option value=''></option><option selected>Option 1</option></select>")
    data = { type: 'select', elementSelector: '[name=interest]' }

    expect(FormsJs.Values.get(data)).toEqual('Option 1')

  it 'gets the checked value of a radio button', ->
    setFixtures("<input type='radio' name='gender' value='male'><input type='radio' name='gender' value='female' checked>")
    data = { type: 'radio', elementSelector: '[name=gender]' }

    expect(FormsJs.Values.get(data)).toEqual('female')

  it 'gets an array of the checked values of checkboxes', ->
    setFixtures(
      "<input type='checkbox' name='options' value='Option 1'>
       <input type='checkbox' name='options' value='Option 2' checked>
       <input type='checkbox' name='options' value='Option 3' checked>")
    data = { type: 'checkbox', elementSelector: '[name=options]' }

    expect(FormsJs.Values.get(data)).toEqual(['Option 2', 'Option 3'])

  it 'should return an empty string if no value exists or none are checked', ->
    setFixtures("<input type='radio' name='gender' value='male'><input type='radio' name='gender' value='female'>")
    data = { type: 'radio', elementSelector: '[name=gender]' }

    expect(FormsJs.Values.get(data)).toEqual('')

