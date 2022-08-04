## Q4
Please provide us with a list
of application design patterns and assumptions you may have employed in
the process of designing System


### Single table inheritance

For **Accounts model**, a single table inheritance pattern used since we have two different types of accounts with no differences in the columns. The only difference is in the relation and are handled separately.
Also so we can easily add any common methods in the main Account model and avoid redundancy.

### Polymorphic relation
  It's used in **Comment** and **Attachment** models. Since these models may belong to different types of models.
