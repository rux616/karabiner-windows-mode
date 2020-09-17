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
        [output.to_type]: [
          output.output,
        ],
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
  outputKey(key, modifiers=null, output_type='to'):: {
    to_type: output_type,
    output: {
      key_code: key,
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
  condition(type, bundles):: {
    type: 'frontmost_application_' + type,
    bundle_identifiers: bundles,
  },
}
