import * as React from 'react'
import { useQuery, gql } from '@apollo/client';


const FreezerView: React.FC = () => {
    const { data } = useQuery(gql`query AllFreezers {
        freezers {
          id
          racks {
            id
            boxes {
              id
              samples {
                id
              }
            }
          }
        }
      }`)

    React.useEffect(() => {
        console.log(data)
    }, [data])

    return <div>
        freezer
    </div>
}

export default FreezerView