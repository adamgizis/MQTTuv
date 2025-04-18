#ifndef SERVER_H
#define SERVER_H

/* Error codes for packet reception, signaling respectively
 * - client disconnection
 * - error reading packet
 * - error packet sent exceeds size defined by configuration (generally default
 *   to 2MB)
 */
#define ERRCLIENTDC         1
#define ERRPACKETERR        2
#define ERRMAXREQSIZE       3


/* Global informations statistics structure */
struct info{
    /* Number of clients currently connected */
    int nclients;
    /* Total number of clients connected since the start */
    int nconnections;
    /* Timestamp of the start time */
    long long start_time;
};

//takes in ip address and the port to listen on
int start_server(const char *, const char *);


#endif