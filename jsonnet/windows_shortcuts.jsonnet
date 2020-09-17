//---------//
// IMPORTS //
//---------//

local bundle = import 'lib/bundle.libsonnet';
local k = import 'lib/karabiner.libsonnet';


//------//
// MAIN //
//------//

{
  title: 'Windows Shortcuts',
  rules: [
    // Navigation Keys
    k.rule('Insert (Ctrl) [+Terminal Emulators]',
           k.input('insert', ['control']),
           k.outputKey('c', ['command']),
           k.condition('unless', bundle.hypervisors + bundle.ides + bundle.remoteDesktops)),
    k.rule('Insert (Ctrl)',
           k.input('insert', ['control']),
           k.outputKey('c', ['command']),
           k.condition('unless', bundle.standard)),
    k.rule('Insert (Shift) [+Terminal Emulators]',
           k.input('insert', ['shift']),
           k.outputKey('v', ['command']),
           k.condition('unless', bundle.hypervisors + bundle.ides + bundle.remoteDesktops)),
    k.rule('Insert (Shift)',
           k.input('insert', ['shift']),
           k.outputKey('v', ['command']),
           k.condition('unless', bundle.standard)),
    k.rule('Home',
           k.input('home'),
           k.outputKey('left_arrow', ['command']),
           k.condition('unless', bundle.standard)),
    k.rule('Home (Ctrl)',
           k.input('home', ['control']),
           k.outputKey('up_arrow', ['command']),
           k.condition('unless', bundle.standard)),
    k.rule('Home (Shift)',
           k.input('home', ['shift']),
           k.outputKey('left_arrow', ['command', 'shift']),
           k.condition('unless', bundle.standard)),
    k.rule('Home (Ctrl+Shift)',
           k.input('home', ['control', 'shift']),
           k.outputKey('up_arrow', ['command', 'shift']),
           k.condition('unless', bundle.standard)),
    k.rule('End',
           k.input('end'),
           k.outputKey('right_arrow', ['command']),
           k.condition('unless', bundle.standard)),
    k.rule('End (Ctrl)',
           k.input('end', ['control']),
           k.outputKey('down_arrow', ['command']),
           k.condition('unless', bundle.standard)),
    k.rule('End (Shift)',
           k.input('end', ['shift']),
           k.outputKey('right_arrow', ['command', 'shift']),
           k.condition('unless', bundle.standard)),
    k.rule('End (Ctrl+Shift)',
           k.input('end', ['control', 'shift']),
           k.outputKey('down_arrow', ['command', 'shift']),
           k.condition('unless', bundle.standard)),
    k.rule('Left Arrow (Ctrl)',
           k.input('left_arrow', ['control']),
           k.outputKey('left_arrow', ['option']),
           k.condition('unless', bundle.standard)),
    k.rule('Left Arrow (Ctrl+Shift)',
           k.input('left_arrow', ['control', 'shift']),
           k.outputKey('left_arrow', ['option', 'shift']),
           k.condition('unless', bundle.standard)),
    k.rule('Right Arrow (Ctrl)',
           k.input('right_arrow', ['control']),
           k.outputKey('right_arrow', ['option']),
           k.condition('unless', bundle.standard)),
    k.rule('Right Arrow (Ctrl+Shift)',
           k.input('right_arrow', ['control', 'shift']),
           k.outputKey('right_arrow', ['option', 'shift']),
           k.condition('unless', bundle.standard)),
    // Command Keys
    k.rule('Backspace (Ctrl)',
           k.input('delete_or_backspace', ['control']),
           k.outputKey('delete_or_backspace', ['option']),
           k.condition('unless', bundle.standard)),
    k.rule('Delete (Ctrl)',
           k.input('delete_forward', ['control']),
           k.outputKey('delete_forward', ['option']),
           k.condition('unless', bundle.standard)),
    k.rule('Enter (Ctrl)',
           k.input('return_or_enter', ['control']),
           k.outputKey('return_or_enter', ['command']),
           k.condition('unless', bundle.standard)),
    k.rule('Enter (Ctrl+Shift)',
           k.input('return_or_enter', ['control', 'shift']),
           k.outputKey('return_or_enter', ['command', 'shift']),
           k.condition('unless', bundle.standard)),
    // Modifier Keys
    k.rule('Win',
           k.input('command', key_is_modifier=true),
           k.outputKey('launchpad', output_type='to_if_alone')),
    // Alphanumeric Keys
    k.rule('A (Ctrl)',
           k.input('a', ['control']),
           k.outputKey('a', ['command']),
           k.condition('unless', bundle.standard)),
    k.rule('B (Ctrl)',
           k.input('b', ['control']),
           k.outputKey('b', ['command']),
           k.condition('unless', bundle.standard)),
    k.rule('C (Ctrl)',
           k.input('c', ['control']),
           k.outputKey('c', ['command']),
           k.condition('unless', bundle.standard)),
    k.rule('C (Ctrl+Shift) [Only Terminal Emulators]',
           k.input('c', ['control', 'shift']),
           k.outputKey('c', ['command']),
           k.condition('if', bundle.terminalEmulators)),
    k.rule('F (Ctrl)',
           k.input('f', ['control']),
           k.outputKey('f', ['command']),
           k.condition('unless', bundle.standard)),
    k.rule('I (Ctrl)',
           k.input('i', ['control']),
           k.outputKey('i', ['command']),
           k.condition('unless', bundle.standard)),
    k.rule('L (Win) [Login Window]',
           k.input('l', ['command']),
           k.outputShell('/System/Library/CoreServices/Menu\\ Extras/User.menu/Contents/Resources/CGSession -suspend')),
    k.rule('L (Win) [Lock Screen]',
           k.input('l', ['command']),
           k.outputKey('power', ['control', 'shift'])),
    k.rule('L (Alt+Ctrl) [Login Window]',
           k.input('l', ['control', 'option']),
           k.outputShell('/System/Library/CoreServices/Menu\\ Extras/User.menu/Contents/Resources/CGSession -suspend')),
    k.rule('L (Alt+Ctrl) [Lock Screen]',
           k.input('l', ['control', 'option']),
           k.outputKey('power', ['control', 'shift'])),
    k.rule('N (Ctrl)',
           k.input('n', ['control']),
           k.outputKey('n', ['command']),
           k.condition('unless', bundle.standard)),
    k.rule('O (Ctrl)',
           k.input('o', ['control']),
           k.outputKey('o', ['command']),
           k.condition('unless', bundle.standard)),
    k.rule('P (Ctrl)',
           k.input('p', ['control']),
           k.outputKey('p', ['command']),
           k.condition('unless', bundle.standard)),
    k.rule('R (Ctrl)',
           k.input('r', ['control']),
           k.outputKey('r', ['command']),
           k.condition('unless', bundle.standard)),
    k.rule('S (Ctrl)',
           k.input('s', ['control']),
           k.outputKey('s', ['command']),
           k.condition('unless', bundle.standard)),
    k.rule('T (Ctrl)',
           k.input('t', ['control']),
           k.outputKey('t', ['command']),
           k.condition('unless', bundle.standard)),
    k.rule('U (Ctrl)',
           k.input('u', ['control']),
           k.outputKey('u', ['command']),
           k.condition('unless', bundle.standard)),
    k.rule('V (Ctrl)',
           k.input('v', ['control']),
           k.outputKey('v', ['command']),
           k.condition('unless', bundle.standard)),
    k.rule('V (Ctrl+Shift) [Only Terminal Emulators]',
           k.input('v', ['control', 'shift']),
           k.outputKey('v', ['command']),
           k.condition('if', bundle.terminalEmulators)),
    k.rule('W (Ctrl)',
           k.input('w', ['control']),
           k.outputKey('w', ['command']),
           k.condition('unless', bundle.standard)),
    k.rule('X (Ctrl)',
           k.input('x', ['control']),
           k.outputKey('x', ['command']),
           k.condition('unless', bundle.standard)),
    k.rule('Y (Ctrl)',
           k.input('y', ['control']),
           k.outputKey('y', ['command']),
           k.condition('unless', bundle.standard)),
    k.rule('Z (Ctrl)',
           k.input('z', ['control']),
           k.outputKey('z', ['command']),
           k.condition('unless', bundle.standard)),
    // Punctuation Keys
    k.rule('/ (Ctrl) [+Terminal Emulators]',
           k.input('slash', ['control']),
           k.outputKey('slash', ['command']),
           k.condition('unless', bundle.hypervisors + bundle.ides + bundle.remoteDesktops)),
    k.rule('Space (Ctrl)',
           k.input('spacebar', ['control']),
           k.outputKey('spacebar', ['command']),
           k.condition('unless', bundle.standard)),
    // Function Keys
    k.rule('F1',
           k.input('f1'),
           k.outputKey('slash', ['command', 'shift']),
           k.condition('unless', bundle.standard)),
    k.rule('F3',
           k.input('f3'),
           k.outputKey('g', ['command']),
           k.condition('unless', bundle.standard)),
    k.rule('F4 (Alt) [+Terminal Emulators]',
           k.input('f4', ['option']),
           k.outputKey('q', ['command']),
           k.condition('unless', bundle.hypervisors + bundle.ides + bundle.remoteDesktops)),
    k.rule('F4 (Ctrl) [Only Chrome]',
           k.input('f4', ['control']),
           k.outputKey('w', ['command']),
           k.condition('if', ['^com\\.google\\.Chrome$'])),
  ],
}
