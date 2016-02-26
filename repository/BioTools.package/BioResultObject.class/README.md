A result object is a wrapper for results.

A result object uses a reader to fetch its contents.

Other responsibilities includes triggering activation of remote queries, by sending a message to its client.

It also contains an exit status which you may query by sending the #status message. Value <true> means the query executed successfully and <false> otherwise.
