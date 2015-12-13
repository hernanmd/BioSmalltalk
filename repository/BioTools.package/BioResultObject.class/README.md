A search result is a wrapper for results.

The search result object uses a reader to fetch the results which are interesting.

Other responsibility includes to trigger real activation of remote queries, accomplishing this goal sending a message to its client.

It also contains an exit status which you may query by sending the #status message. Value <true> means the query executed successfully and <false> otherwise.
