test: test_there_are_users {
explore_source: users {
column: count {}
}
assert: there_is_data {
expression: ${users.count} > 0 ;;
}
}