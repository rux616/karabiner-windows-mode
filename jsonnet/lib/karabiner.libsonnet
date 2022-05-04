{
  //-----------//
  // FUNCTIONS //
  //-----------//

  // rule
  //
  // description (string, required)
  //   description of a rule, should be '<key> (<modifier1>+...+<modifierN>) [<specialNotes>]'
  //
  // input (object, required)
  //   input object for a rule; use input()
  //
  // output (object, required)
  //   output object for a rule; use outputKey() or outputShell()
  //
  // condition (object, optional)
  //   condition for a trigger; use condition()
  rule(description, input, output, condition=null):: {
    description: description,
    manipulators: [
      {
        from: input,
      } + {
        [o.to_type]: [o.output]
        for o in if std.isArray(output) then output else [output] + []
      } + {
        [if condition != null then 'conditions']: [
          condition,
        ],
        type: 'basic',
      },
    ],
  },

  // input
  //
  // key (string, required)
  //   key that will trigger a rule
  //
  // modifiers (array, optional)
  //   modifiers that, when combined with <key>, trigger a rule
  //
  // key_is_modifier (boolean, optional)
  //   removes entire 'modifiers' object; only use when <key> is a modifier itself
  input(key, modifiers=null, key_is_modifier=false):: {
    key_code: key,
    [if key_is_modifier then null else 'modifiers']: {
      [if modifiers != null then 'mandatory']: modifiers,
      optional: ['any'],
    },
  },

  // outputKey
  //
  // key (string, required)
  //   key to output when a rule is triggered
  //
  // modifiers (array, optional)
  //   modifiers to add to the key when a rule is triggered
  //
  // output_type (string, optional)
  //   type of 'to' object; should normally be left alone
  outputKey(key, modifiers=null, output_type='to', key_code='key_code',):: {
    to_type: output_type,
    output: {
      [key_code]: key,
      [if modifiers != null then 'modifiers']: modifiers,
    },
  },

  // outputShell
  //
  // command (string, required)
  //   the command to run when a rule is triggered
  outputShell(command):: {
    to_type: 'to',
    output: {
      shell_command: command,
    },
  },

  // condition
  //
  // type (string, required)
  //   the 'frontmost_application' type to use. common values are 'if' or 'unless'
  //
  // bundles (array, required)
  //   bundle identifiers of applications
  //
  // file_paths (array, optional)
  //   file path identifiers of applications
  condition(type, bundles, file_paths=null):: {
    type: 'frontmost_application_' + type,
    bundle_identifiers: bundles,
    [if file_paths != null then 'file_paths']: [
      file_paths,
    ],
  },

  // runDockedApp
  //
  // number (string, required)
  //   the number of the docked app to run (zero-indexed)
  //   note that the list of apps does not include Finder, which is permanently
  //   pinned to the dock as the first item
  runDockedApp(number):: {
    to_type: 'to',
    output: {
      shell_command: "open -b $(/usr/libexec/PlistBuddy -c 'print :persistent-apps:" + number + ":tile-data:bundle-identifier' ~/Library/Preferences/com.apple.dock.plist)",
    },
  },
}
