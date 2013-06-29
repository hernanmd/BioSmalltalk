A search result object responsibility is to trigger the real activation of the remote query, accomplishing this goal sending a message to its client.

The search result object uses a reader to fetch the results which are interesting.

It also contains an exit status which you may query by sending the #status message. Value <true> means the query executed successfully and <false> otherwise.
